<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet" />
    <link href="https://file.myfontastic.com/6P7psgxXbBEmnhfE8LE3CV/icons.css" rel="stylesheet" />
    <!-- Librerías de bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="view/css/styles.css" />
    <link rel="stylesheet" href="view/css/customers_login_styles.css">
</head>

<body>
    <input type="checkbox" id="checkbox1" />
    <input type="checkbox" id="chkbox1-sliderbanner" />
    <input type="checkbox" id="chkbox2-sliderbanner" />
    <input type="checkbox" id="chkbox3-sliderbanner" />
    <input type="checkbox" id="chkbox4-sliderbanner" />

    <!-- SLIDER MENÚ -->
    <section class="slider-menu">
        <label for="checkbox1" id="label-button">
            <span class="material-symbols-outlined"> close </span>
        </label>
        <ul>
            <li>
                <a href="index.php">
                    <span class="material-symbols-outlined"> house </span>
                    <p>Página Principal</p>
                </a>
            </li>
            <li>
                <a href="customers_login.php">
                    <span class="material-symbols-outlined"> airplane_ticket </span>
                    <p>Comprar Boleto</p>
                </a>
            </li>
            <li>
                <a href="corporate_login.php">
                    <span class="material-symbols-outlined"> engineering </span>
                    <p>AeroAvance System</p>
                </a>   
            </li>
            <li>
                <a href="index.php">
                    <span class="material-symbols-outlined">call</span>
                    <p>Contacto</p>
                </a>
            </li>
            <li>
                <a href="index.php">
                    <span class="material-symbols-outlined">info</span>
                    <p>Acerca de</p>
                </a>
            </li>
        </ul>
    </section>
    <!-- MENÚ SUPERIOR -->
    <section class="menu">
        <label for="checkbox1">
            <span class="material-symbols-outlined"> menu </span>
        </label>

        <div class="search">
            <span class="material-symbols-outlined"> search </span>
        </div>
        <div class="menu-users">
            <span class="material-symbols-outlined"> favorite </span>
            <span class="material-symbols-outlined"> shopping_cart </span>
            <span class="material-symbols-outlined"> account_circle </span>
        </div>
    </section>

    <main>