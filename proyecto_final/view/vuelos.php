<?php require "view/layout/header.php" ?>
<br>
<h1>INTERFAZ DE VUELOS</h1>
<br>
<h1>Lista de Vuelos Disponibles</h1>
<br>
<h2> Origen -
    <?php
    echo $origen;
    ?>
</h2>
<h2> Destino -
    <?php
    echo $destino;
    ?>
</h2>
<br>
<table class="table table-hover">
    <tr>
        <td>Origen</td>
        <td>Destino</td>
        <td>Fecha</td>
        <td>Pasajeros</td>
        <td>Precio</td>
        <td>Accion</td>
    </tr>
    <?php
    if (!empty($vuelos))
        foreach ($vuelos as $key => $value) foreach ($value as $va):
                echo "<tr><td>" . $va['Origen'] . "</td><td>" . $va['Destino'] . "</td><td>" . $va['Fecha'] . "</td><td>" . $va['Pasajeros'] . "</td><td>" . $va['Precio'] . "</td>";
                echo "<td><a href='vuelos.php?m=compra&id=" . $va['Id'] . "'>Comprar</a> ";
                echo "</tr>";
            endforeach;

    ?>
</table>
<?php require "view/layout/footer.php" ?>