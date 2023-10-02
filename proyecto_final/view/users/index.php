<?php
require "view/layout/header.php"
    ?>
<br>
<h1>Listado de Usuarios</h1>
<br>
<a href="users.php?m=nuevo">NUEVO</a>
<table class="table table-hover">
    <tr>
        <td>Id</td>
        <td>Tipo</td>
        <td>Nombre</td>
        <td>Número de Teléfono</td>
        <td>Email</td>
        <td>Estado</td>
        <td>Opciones</td>
    </tr>
    <?php
    if (!empty($dato))
        foreach ($dato as $key => $value) foreach ($value as $va):
                echo "<tr><td>" . $va['id'] . "</td><td>" . $va['type'] . "</td><td>" . $va['name'] . "</td><td>" . $va['phone_number'] . "</td><td>" . $va['email'] . "</td><td>" . $va['state'] . "</td>";
                echo "<td><a href='users.php?m=editar&id=" . $va['id'] . "'>ACTUALIZAR</a> ";
                echo "<a href='users.php?m=eliminar&id=" . $va['id'] . "'>ELIMINAR</a></td>";
                echo "</tr>";
            endforeach;

    ?>
</table>
<?php require "view/layout/footer.php" ?>