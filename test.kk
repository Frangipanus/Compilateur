fun getnum() 
    val x = 0 
    fn () { x }

fun main() 
    val f = getnum() 
    repeat(10)
        println(f())
