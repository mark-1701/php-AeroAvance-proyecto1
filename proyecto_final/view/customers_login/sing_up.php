<?php require "view/layout/customers_login_header.php" ?>
<div class="myContainer">
    <h1>Registrarse</h1>
    <form class="form">
        <br><br>
        <label for="name">Nombre:</label>
        <input type="text" id="name" name="name" class="form-control" required>
        <br>

        <label for="email">Email:</label>
        <input type="text" id="email" name="email" class="form-control" required>
        <br>

        <label for="password">Contraseña:</label>
        <input type="password" id="password" name="password" class="form-control" required>
        <br><br>
        <input type="submit" name="m" value="Registrarse" class="btn btn-primary">
    </form>
</div>
<?php require "view/layout/footer.php" ?>