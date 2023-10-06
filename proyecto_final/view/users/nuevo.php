<?php require "view/layout/header.php" ?>
<div class="short-card">
    <br>
    <h1>NUEVO</h1>
    <hr>
    <form action="">
        <label for="" class="special-label">Tipo</label> <br>
        <input type="text" name="type" class="form-control"><br>
        <label for="" class="special-label">Nombre</label><br>
        <input type="text" name="name" class="form-control"><br>
        <label for="" class="special-label">Email</label><br>
        <input type="text" name="email" class="form-control"><br>
        <label for="" class="special-label">Password</label><br>
        <input type="text" name="password" class="form-control"><br>
        <label for="" class="special-label">Estado</label><br>
        <input type="text" name="state" class="form-control"><br>
        <input type="submit" name="btn" class="btn btn-primary">
        <input type="hidden" name="m" value="guardar">
    </form>
</div>
<?php require "view/layout/footer.php" ?>