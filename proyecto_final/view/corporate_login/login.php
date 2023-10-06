<?php require "view/layout/corporate_login_header.php" ?>
<div class="myContainer">
    <h1>Iniciar Sesión</h1>
    <form class="form">
        <br><br>

        <label for="email">Email:</label>
        <input type="text" id="email" name="email" class="form-control" required>
        <br>

        <label for="password">Contraseña:</label>
        <input type="password" id="password" name="password" class="form-control" required>
        <a href="corporate_login.php?m=recoverPassword" id="recoverPassword">¿Olvidaste tu contraseña?</a>
        <br><br>
        <input type="submit" name="m" value="Acceder" class="btn btn-primary">
        <a href="corporate_login.php?m=singUp" id="singUp">Crear una cuenta</a>
    </form>

    <?php
    if (isset($mensaje)) {
        echo '<br>';
        echo '<div class="error" style="color:red">' . $mensaje . '</div>';
    }
    ?>
</div>
<?php require "view/layout/footer.php" ?>