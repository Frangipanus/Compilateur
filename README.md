# Compilateur
Compilateur de petit_koka

## Lexeur-Parseur
### Choix de l'AST
Nous avons décider de nous simplifier la vie dans la création de l'AST, et pour ce faire, nous avons un peu dérivé de la grammaire donnée. 
En clair, dans l'ast, on ne distingue pas les atoms et les bexpr, et on ne distingue pas les type et les atypes. Ainsi, l'AST peut techniquement
contenir des choses non correctes pour la grammaire de Koka. Cependant, cela n'arrive jamais car le parser assure que tout ce qui sera construit
respecte la grammaire. Ainsi, certains warning apparaissent disant que le matching n'est pas complet au niveau du typage (tout les cas atteignable)
sont traité. 

### Indentation
Pour gerer l'indentation, il y a une une fonction tout en bas qui appele les lexemes, mets leur tokens dans une pile et intercale des token si nécéssaire pour revoyer des tokens un par un au parser. Nous avons bien pensé a faire tous les caractère d'échappement. *

### Reconaissance de mot clef
On a mis les mot clef dans une table de hashage, et quand on lit un ident on cherche a savoir si l'ident est dadans

### Règlement des conlifts
Pour regler les conflits nous avons utiliser des règles de précédence. Nous avons de plus implémenté tout le sucre syntaxique. 

### Commenaires annexe 
Pour verifier que la dernière expression d'un bloc est ni val ni var une fonction est présente en haut du parseur. 


## Typeur
Pour l'écriture du typeur, nous nous sommes basés sur le TD 6 : Algorithme W. On parcours récursivement l'arbre renvoyé par le parseur pour construire un nouvel arbre typé.
En plus des variables de type, nous avons introduit des variables d'effet. Les variables de types sont utilisées dans deux contextes : une liste vide introduit une variables de type et le type de renvoie d'une fonction en est également une lorsque celui-ci doit-être inféré. Comme koka a un typage monomorphe, ces variables de types ne sont jamais généralisées.
Les variables d'effet sont utilisées pour l'inférence de l'effet du type de renvoi d'une fonction.

## Génération de code
### Calcul des variables libres
La première étapes est de calculer les variables libres des fonctions, afin de pouvoir après calculer les clotures.
Pour les blocs, il y a eu des problèmes, voir les tests difficiles a la fin. L'idée est que certaine variables peuvent perdre leur liberté dans un bloc,
et ça on le gère en disant que on consturit au fur et a mesure une liste de variables qui n'ont pas le droit d'être libre.  (c'est le sens du bon, mauvais et oui, non)

### Gerer les val et les var
Il faut de toute faccon allouer les var pour réussir le test 3 des test dur, celui avec la fonction d'incrémentation. On peut pour réussir vouloir aussi allouer celle qui sont des val, mais par exemple pour mandelbrot vu que on alloue trop de chose on a un segfault.
### Compilation des fonctions 
Toutes les fonctions sont considéré comme des colures à l'execption de: head, tail, default et println qui ont leur place dans l'ast. Les élément de la clorture sont stocké dans le registre rsi (rsi a en fait la position d'un tableau alloué sur le tas), et de même les arguments de la fonction sont stocké dans rdi. Le choix du stockage des arguments était purement arbitraire. 

### Compilation des variables
Les variables locales sont stocké sur la pile. On stocke de la même manière les valeurs et les variables. Les objets sont représenté comme le demande l'ennoncé. Les variables libre sont donné par passage par référence. 

### Compilations des boucles
Pour les while, on compile d'abord la fonction booléenes qui dit si oui ou non on s'arrète puis a l'aide d'étiquette on se deplace comme il faut dans le fichier assembleur. Pour les for on met l'argument dans un compteur que l'on incrémente a chaque tour de boucle jusqu'a arriver a la borne sup du for. Similaireme pour les repeat. 

### Remarque générale
Le code est dit "idiot-proof" dans le sens ou memes des noms de fonction alambiqués ne devrait pas faire échouer le compilateur. On se s'occupe pas de liberer la mémoire, on laisse gcc s'occuper de ça quand l'assembleur est compiler. 



## Utilisation du compilateur 

Taper 
```console
make
```
pour créer un executable nommé kokac. Ce dernier prend ensuite un fichier en .koka et un argument --parse-only ou --type-only pour ne faire que la phase d'analyse 
ou que la phase de typage. Exemple
```console
./kokac.exe --type-only test.koka
```
Si on tape 
```console
./kokac.exe file.koka
```
et que file.koka est correct pour koka alors cela creer un fhichier file.s

## Sur les warning 
Un des warning vient du fait qu'on utilise pas encore p2 qui est le typed-ast. 
L'autre viens d'un matching non complet mais c'est voulu et controlé en amont. 

## Sur les tests diaboliques
Voici quelques tests qui sont difficiles et pourquoi ils le sont pour moi
```
fun main()
    var x := 3
    var i := 8
    while {x > 0}
        val i = i + 8
        x := 0
    println(i)
```
ici dans val i = i + 8 le i a droite est la variables libre, mais perd sa liberté. On doit renvoyer 8. De meme,
```
fun main()
    var x := 3
    var i := 8
    while {i > 0}
        i := i - 1
        val i = i + 8
    println(i)
```
doit marcher et renvoyer 0. 

Ce test aussi m'a forcer a declarer differement les vars et les vals. 
```
fun getnum() 
    var x := 0 
    fn () {x := x + 1; x}

fun main() 
    val f = getnum() 
    repeat(10)
        println(f())
```

```
fun getnum() 
    val x = 0 
    fn () { x}

fun main() 
    val f = getnum() 
    repeat(10)
        println(f())
    ``` quid de ce test? demander a jcf
# Remerciement
Nous remercions Jeanh-Cristophe Filliâtre pour le module x86_64, ainsi que le cours qu'il nous a prodigué nous ayant permis de mener ce projet a bien, ainsi que le chargé de TD Jérome Boillot.