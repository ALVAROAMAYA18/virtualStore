<?php include_once 'Views/template/header-principal.php'; ?>

<!-- Start Banner Hero -->
<div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
  <ol class="carousel-indicators">
    <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
    <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
    <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <div class="container">
        <div class="row p-5">
          <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
            <img class="d-block w-100" src="<?php echo BASE_URL; ?>assets/images/carrusel/1.png" alt="" width="500" height="400">
          </div>
          <div class="col-lg-6 mb-0 d-flex align-items-center">
            <div class="text-center text-align-left align-self-center">
              <h1 class="h1 text-success"><b>LAESTACIÓN</b>.net</h1>
              <h3 class="h2">Tu proveedor de papelería a un <b>click!</b></h3>
              <p>
                Los mejores productos de papelería escolar, útiles y mas herramientas para colegio <b>AHORA EN NUESTRA TIENDA ONLINE</b>, siempre a tu
                servicio fácil y seguro. Productos escolares para tus hijos y los mas pequeños de la familia para que aprendan y
                se diviertan con nuestros útiles de papelería escolar.
              </p>

            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="carousel-item">
      <div class="container">
        <div class="row p-5">
          <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
            <img class="d-block w-100" src="<?php echo BASE_URL; ?>assets/images/carrusel/2.png" alt="" width="500" height="400">
          </div>
          <div class="col-lg-6 mb-0 d-flex align-items-center">
            <div class="text-align-left">
              <h1 class="h1 text-success"><b>SOMOS MAYORISTAS!</b></h1>
              <h3 class="h2">Con mas de 6 años entregando calidad.</h3>
              <p>
                Contamos con entregas inmediatas en Bucaramanga, Girón y Piedecuesta. Recibe tu pedido directamente a tu negocio.
              </p>

            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="carousel-item">
      <div class="container">
        <div class="row p-5">
          <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
            <img class="d-block w-100" src="<?php echo BASE_URL; ?>assets/images/carrusel/3.png" alt="" width="500" height="400">
          </div>
          <div class="col-lg-6 mb-0 d-flex align-items-center">
            <div class="text-align-left">
              <h1 class="h1 text-success"><b>PAPELERÍA PARA TU OFICINA!</b></h1>
              <h3 class="h2">Explora nuestro catálogo y descubre como transformar tu oficina.</h3>
              <p>
                En LAESTACION.NET también contamos con Artículos exclusivos e innovadores para que personalices tus espacios de trabajo.
              </p>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel"
    role="button" data-bs-slide="prev">
    <i class="fa fa-chevron-left"></i>
  </a>
  <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel"
    role="button" data-bs-slide="next">
    <i class="fa fa-chevron-right"></i>
  </a>
</div>
<!-- End Banner Hero -->


<!-- Start Categories of The Month -->
<section class="container py-5">
  <div class="row text-center pt-3">
    <div class="col-lg-6 m-auto">
      <h1 class="h1">Categorías</h1>
      <p>
        A continucación las categorías disponibles para tí:
      </p>
    </div>
  </div>
  <div class="row">
    <?php foreach ($data['categorias'] as $categoria) { ?>
      <div class="col-12 col-md-2 p-5 mt-3">
        <a href="<?php echo BASE_URL . 'principal/categorias/' . $categoria['id']; ?>"><img src="<?php echo $categoria['imagen']; ?>" class="rounded-circle border mx-auto d-block" width="130" height="120"></a>
        <h5 class="text-center mt-3 mb-3"><?php echo $categoria['categoria']; ?></h5>
      </div>
    <?php } ?>
  </div>
</section>
<!-- End Categories of The Month -->


<!-- Start Featured Product -->
<section class="bg-light">
  <div class="container py-5">
    <div class="row text-center py-3">
      <div class="col-lg-6 m-auto">
        <h1 class="h1">Productos</h1>
        <p>
          Los mejores productos disponibles para tí:
        </p>
      </div>
    </div>
    <div class="row">
      <?php foreach ($data['nuevoProductos'] as $producto) { ?>
        <div class="col-12 col-md-4 mb-4">
          <div class="card h-100">
            <a href="<?php echo BASE_URL . 'principal/detail/' . $producto['id']; ?>">
              <img src="<?php echo $producto['imagen']; ?>" class="card-img-top" alt="<?php echo $producto['nombre']; ?>">
            </a>
            <div class="card-body">
              <ul class="list-unstyled d-flex justify-content-between">
                <?php
                $uno = ($producto['calificacion'] >= 1) ? 'text-warning' : 'text-muted';
                $dos = ($producto['calificacion'] >= 2) ? 'text-warning' : 'text-muted';
                $tres = ($producto['calificacion'] >= 3) ? 'text-warning' : 'text-muted';
                $cuatro = ($producto['calificacion'] >= 4) ? 'text-warning' : 'text-muted';
                $cinco = ($producto['calificacion'] == 5) ? 'text-warning' : 'text-muted';
                ?>
                <li>
                  <i class="<?php echo $uno; ?> fa fa-star"></i>
                  <i class="<?php echo $dos; ?> fa fa-star"></i>
                  <i class="<?php echo $tres; ?> fa fa-star"></i>
                  <i class="<?php echo $cuatro; ?> fa fa-star"></i>
                  <i class="<?php echo $cinco; ?> fa fa-star"></i>
                </li>
                <li class="text-muted text-right"><?php echo MONEDA . ' ' . $producto['precio']; ?></li>
              </ul>
              <a href="<?php echo BASE_URL . 'principal/detail/' . $producto['id']; ?>" class="h2 text-decoration-none text-dark"><?php echo $producto['nombre']; ?></a>
              <p class="card-text">
                <?php echo $producto['descripcion']; ?>
              </p>
            </div>
          </div>
        </div>
      <?php } ?>
    </div>
  </div>
</section>
<!-- End Featured Product -->
<?php include_once 'Views/template/footer-principal.php'; ?>

</body>

</html>