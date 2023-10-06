<?php require "view/layout/header.php" ?>
<div class="short-card">
    <br>
    <h1>Editar</h1>
    <form action="">

        <?php foreach ($dato as $value): ?>
            <?php foreach ($value as $v): ?>

                <label for="">Tipo</label> <br>
                <input type="text" name="type" value="<?php echo $v['type'] ?>" class="form-control"><br>
                <label for="">Nombre</label><br>
                <input type="text" name="name" value="<?php echo $v['name'] ?>" class="form-control"><br>
                <label for="">Email</label><br>
                <input type="text" name="email" value="<?php echo $v['email'] ?>" class="form-control"><br>
                <label for="">Password</label><br>
                <input type="text" name="password" value="<?php echo $v['password'] ?>" class="form-control"><br>
                <label for="">Estado</label><br>
                <input type="text" name="state" value="<?php echo $v['state'] ?>" class="form-control"><br>

                <input type="hidden" name="id" value="<?php echo $v['id'] ?>" class="form-control">
                <input type="submit" name="btn" value="ACTUALIZAR" class="btn btn-primary">
            <?php endforeach ?>
        <?php endforeach ?>

        <input type="hidden" name="m" value="update">
    </form>
</div>
<?php require "view/layout/footer.php" ?>