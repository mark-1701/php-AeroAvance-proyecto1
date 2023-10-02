<?php require "view/layout/header.php" ?>
    <div class="short-card">
        <br>
        <h1>Listado de vuelos</h1>
        <form method="post" action="vuelos.php">
            <label for="ubicaciones" class="special-label">Desde</label>
            <br>
            <select name="desde_ubicaciones" class="form-control">
                <?php
                if (!empty($origen))
                    foreach ($origen as $key => $value)
                        foreach ($value as $va) :
                            echo '<option id=' . $va['id'] . ' value="' . $va['Nombre'] . '">' . $va['Nombre'] . '</option>';
                        endforeach;
                ?>
                <!-- Agrega más opciones aquí -->
            </select>
            <br>
            <label for="hubicaciones" class="special-label">Hacia</label>
            <br>
            <select name="hacia_ubicaciones" class="form-control">
                <?php
                if (!empty($destinos))
                    foreach ($destinos as $key => $value)
                        foreach ($value as $va) :
                            echo '<option id=' . $va['id'] . ' value="' . $va['Nombre'] . '">' . $va['Nombre'] . '</option>';
                        endforeach;
                ?>
                <!-- Agrega más opciones aquí -->
            </select>
            <br>
            <button type="submit" name="buscar" class="btn btn-primary">Buscar</button>
        </form>
    </div>
<?php require "view/layout/footer.php" ?>