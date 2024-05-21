import System.Environment (getArgs, getEnv)
import System.IO (hPutStrLn, stderr, stdin, stdout, hGetContents, readFile, writeFile)
import System.Exit (exitFailure)


main :: IO ()
main = do
    putStrLn "Seleccione una opción:"
    putStrLn "1. Argumentos de línea de comando"
    putStrLn "2. Standard Streams (Input, Output y Error)"
    putStrLn "3. Variables de ambiente"
    putStrLn "4. File I/O"
    putStrLn "5. Network I/O"
    putStrLn "Ingrese el número de la opción:"
    option <- getLine
    case option of
        "1" -> handleCommandLineArgs
        "2" -> handleStandardStreams
        "3" -> handleEnvironmentVariables
        "4" -> handleFileIO
        _   -> putStrLn "Opción no válida" >> exitFailure

handleCommandLineArgs :: IO ()
handleCommandLineArgs = do
    args <- getArgs
    putStrLn "Los argumentos de linea de comando son:"
    mapM_ putStrLn args

handleStandardStreams :: IO ()
handleStandardStreams = do
    putStrLn "Escriba algo y presione Enter (esto será leido desde stdin):"
    input <- getLine
    putStrLn ("Leíste: " ++ input)
    hPutStrLn stderr "Este es un mensaje de error (stderr)."

handleEnvironmentVariables :: IO ()
handleEnvironmentVariables = do
    putStrLn "Ingrese el nombre de una variable de entorno:"
    varName <- getLine
    value <- getEnv varName
    putStrLn ("El valor de " ++ varName ++ " es: " ++ value)

handleFileIO :: IO ()
handleFileIO = do
    putStrLn "Ingrese el nombre del archivo a leer:"
    fileName <- getLine
    contents <- readFile fileName
    putStrLn ("Contenido del archivo " ++ fileName ++ ":")
    putStrLn contents
    putStrLn "Ingrese el nombre del archivo a escribir:"
    outFile <- getLine
    putStrLn "Ingrese el contenido para escribir en el archivo:"
    outContents <- getLine
    writeFile outFile outContents
    putStrLn ("Contenido escrito en " ++ outFile)

