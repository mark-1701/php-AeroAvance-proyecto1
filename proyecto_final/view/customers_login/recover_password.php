<?php require "view/layout/customers_login_header.php" ?>
<div class="myContainer">
    <h1>Recuperar Contraseña</h1>
    <form class="form">
        <br><br>
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" class="form-control" required>
        <br>

        <label for="newPassword">Nueva Contraseña:</label>
        <input type="password" id="newPassword" name="newPassword" class="form-control" required>
        <br><br>
        <input type="submit" name="m" value="Recuperar" class="btn btn-primary">
    </form>
</div>
<?php require "view/layout/footer.php" ?>