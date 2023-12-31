<style>
  /* Oculta los campos que no deseas mostrar */
  .hide-field {
    display: none;
  }
</style>

<div class="container">
  <h1>FormSubmit Demo</h1>
  <form target="_blank" action="https://formsubmit.co/<?php print_r($vuelo['email'])?>" method="POST">
    <div class="form-group ">
      <div class="form-row">
        <div class="col">
          <div type="text" name="name" class="form-control" placeholder="Full Name" required><?php print_r($vuelo['name'])?></div>
        </div>
        <div class="col">
          <div type="email" name="email" class="form-control" placeholder="Email Address" required><?php print_r($vuelo['email'])?></div>
        </div>
      </div>
    </div>
    <div class="form-group">
      <textarea placeholder="Your Message" class="form-control hide-field" name="message" rows="10" required>Ha sido exitosa su compra de boleto</textarea>
    </div>
    <button type="submit" class="btn btn-lg btn-dark btn-block ">EnviarCorreo</button>
  </form>
  <a href='vuelos.php?m=createPDF'>crearPDF</a>
</div>