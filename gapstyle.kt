@file:Suppress("DEPRECATED_IDENTITY_EQUALS", "UNUSED_PARAMETER")

operator fun Monokai.plus(sth:Darcula): ColorScheme = TODO()

infix fun ColorScheme.with(sth: String) : ColorScheme = TODO()

infix fun ColorScheme.and(sth: Experience) : ColorScheme = TODO()

fun design(from: ColorScheme): ColorScheme = TODO()

interface ColorScheme
interface Experience

object Monokai: ColorScheme
object Darcula: ColorScheme

/**
 * Building a color schema which is designed with productivity-oriented and
 * semantic-highlighting-driven approach.
 *
 * ### Supported Languages
 * Kotlin, Java, Swift, Scala, Javascript, Typescript, C++, Go, Python, Android Logcat,
 * Android, PHP, HTML, XML, JSX, CSS/SCSS/SASS
 *
 * ### Supported IDE
 * IntelliJ IDEA, VSCode, Xcode
 *
 * @param experience Software Engineering Experience
 */
fun buildGapStyle(experience: Experience): ColorScheme {
    return design(from = Monokai + Darcula) with "Productivity" and experience
}
