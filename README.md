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


## Utilisation du compilateur 

Taper 
```console
make main.exe
```
pour créer un executable. Ce dernier prend ensuite un fichier en .koka et un argument --parse-only ou --type-only pour ne faire que la phase d'analyse 
ou que la phase de typage. 
