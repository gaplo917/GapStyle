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
 * Building the world-first* productivity-oriented color scheme
 * for intelliJ, VSCode to fill the gap between programming languages and human.
 *
 * Each supported language is tailored with rich colors while maintaining
 * a comfortable contrast to help developers boost reading and writing speed
 * in different programming languages.
 *
 * ### Supported Languages
 * Kotlin, Java, Swift, Dart, Rust, Scala, Javascript, Typescript, Go, Python, R,
 * Android Logcat, Android Native (C / C++), Objective-C, SQL, HTML, CSS, PHP,
 * Ruby, Erlang, Elixir
 *
 * ### Supported IDE
 * IntelliJ IDEA, VSCode
 *
 * @param experience Software Engineering Experience
 */
fun buildGapStyle(experience: Experience): ColorScheme {
    return design(from = Monokai + Darcula) with "Productivity" and experience
}
