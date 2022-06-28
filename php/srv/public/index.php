<?php

echo '<pre style="font-size: 20px">';

echo 'Hello world!' . PHP_EOL . PHP_EOL;

try {
    $host = getenv('DB_HOST');
    $db = getenv('DB_NAME');
    $user = getenv('DB_USER');
    $pass = getenv('DB_PASSWORD');
    $port = getenv('DB_PORT');
    $charset = 'utf8mb4';
    $pdo = new \PDO(
        "mysql:host=$host;dbname=$db;charset=$charset;port=$port",
        $user,
        $pass,
        [
            \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
            \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC,
            \PDO::ATTR_EMULATE_PREPARES => false,
        ]
    );

    $result = $pdo->query('SELECT * from test_table')->fetchAll();

    echo 'Содержимое таблицы test_table:' . PHP_EOL . PHP_EOL;

    foreach ($result as $rowNumber => $row) {
        echo sprintf('Запись %s:%s', $rowNumber, PHP_EOL);

        foreach ($row as $key => $value) {
            echo sprintf('%s: %s%s', $key, $value, PHP_EOL);
        }
        echo PHP_EOL;
    }

} catch (\Throwable $error) {
    echo '<div style="color: red">' . $error->getMessage() . '</div>';
}
