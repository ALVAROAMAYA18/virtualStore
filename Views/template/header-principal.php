<!DOCTYPE html>
<html lang="es">

<head>
  <title><?php echo TITLE . ' - ' . $data['title']; ?></title>


  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Start favicon -->
  <link rel="apple-touch-icon" href="<?php echo BASE_URL . 'assets/favicon/apple-icon.png'; ?>">
  <link rel="shortcut icon" type="image/x-icon" href="<?php echo BASE_URL . 'assets/favicon/favicon.ico'; ?>">
  <!-- end favicon -->

  <link rel="stylesheet" href="<?php echo BASE_URL . 'assets/css/bootstrap.min.css'; ?>">
  <link rel="stylesheet" href="<?php echo BASE_URL . 'assets/css/templatemo.css'; ?>">
  <link rel="stylesheet" href="<?php echo BASE_URL . 'assets/css/whatsapp.css'; ?>">

  <!-- Load fonts style after rendering the layout styles -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">

  <!-- Slick -->
  <link rel="stylesheet" type="text/css" href="<?php echo BASE_URL . 'assets/css/slick/slick.css'; ?>">
  <link rel="stylesheet" type="text/css" href="<?php echo BASE_URL . 'assets/css/slick/slick-theme.css'; ?>">

  <link rel="stylesheet" type="text/css" href="<?php echo BASE_URL . 'assets/DataTables/datatables.min.css'; ?>">

  <!-- Replace "test" with your own sandbox Business account app client ID -->
  <!-- <script src="https://www.paypal.com/sdk/js?client-id=<?php echo CLIENT_ID; ?>&currency=<?php echo MONEDA; ?>"></script> -->

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
</head>

<body>

  <!-- Whatsapp  -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
  <a href="https://api.whatsapp.com/send?phone=3188097457&text=Hola, haré un pedido pero tengo una inquietud." class="float" target="_blank">
    <i class="fab fa-whatsapp my-float fa-lg fa-fw"></i>
  </a>

  <!-- Start Top Nav -->
  <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
    <div class="container text-light">
      <div class="w-100 d-flex justify-content-between">
        <div>
          <i class="fa fa-envelope mx-2"></i>
          <a class="navbar-sm-brand text-light text-decoration-none" href="#">laestacion.net@hotmail.com</a>
          <i class="fa fa-phone mx-2"></i>
          <a class="navbar-sm-brand text-light text-decoration-none" href="#">+57 318 809 7457</a>
        </div>
        <!-- REDES -->
        <!-- 
        <div>
          <a class="text-light" href="https://fb.com/templatemo" target="_blank" rel="sponsored"><i class="fab fa-facebook-square fa-sm fa-fw me-2"></i></a>
          <a class="text-light" href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
          <a class="text-light" href="https://twitter.com/" target="_blank"><i class="fab fa-twitter fa-sm fa-fw me-2"></i></a>
          <a class="text-light" href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin fa-sm fa-fw"></i></a>
        </div>
        -->
      </div>
    </div>
  </nav>
  <!-- Close Top Nav -->


  <!-- Header -->
  <nav class="navbar navbar-expand-lg navbar-light shadow">
    <div class="container d-flex justify-content-between align-items-center">

      <a class="navbar-brand text-util logo h3 align-self-center" href="<?php echo BASE_URL; ?>">
        <img src="<?php echo BASE_URL; ?>assets/images/logopng.png" alt="">
      </a>

      <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
        <div class="flex-fill">
          <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
            <li class="nav-item">
              <a class="nav-link" href="<?php echo BASE_URL . 'principal/shop' ?>">Tienda</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<?php echo BASE_URL . 'principal/about' ?>">¿Quienes somos?</a>
            </li>
          </ul>
        </div>
        <div class="navbar align-self-center d-flex">
          <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
            <div class="input-group">
              <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
              <button type="submit" class="input-group-text bg-util text-light">
                <i class="fa fa-fw fa-search text-white"></i>
              </button>
            </div>
            <div class="row" id="resultadoBusqueda">

            </div>
          </div>
        </div>
        <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
          <i class="fas fa-fw fa-search text-dark mr-2"></i>
        </a>
        <a class="nav-icon position-relative text-decoration-none <?php echo ($data['perfil'] == 'no') ? '' : 'd-none'; ?>" href="#" id="verCarrito">
          <i class="fas fa-fw fa-cart-arrow-down text-dark mr-1 me-2 ms-2"></i>
          <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-util text-white" id="btnCantidadCarrito">0</span>
        </a>
        <a class="nav-icon position-relative text-decoration-none <?php echo ($data['perfil'] == 'no') ? '' : 'd-none'; ?>" href="<?php echo BASE_URL . 'principal/deseo' ?>">
          <i class="fas fa-fw fa-heart text-dark mr-1 me-2 ms-2"></i>
          <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-util text-white" id="btnCantidadDeseo">0</span>
        </a>
        <?php if (!empty($_SESSION['correoCliente'])) { ?>
          <a class="nav-icon position-relative text-decoration-none" href="<?php echo BASE_URL . 'clientes' ?>">
            <img class="rounded-circle border me-2 ms-2" src="<?php echo BASE_URL . 'assets/images/clientes/default.png' ?>" alt="-LOGO-CLIENTE" width="50">
          </a>
        <?php } else { ?>
          <a class="nav-icon position-relative text-decoration-none" href="#" data-bs-toggle="modal" data-bs-target="#modalLogin">
            <i class="fas fa-fw fa-user text-dark mr-3 me-2 ms-2"></i>
          </a>
        <?php } ?>

      </div>
    </div>

    </div>
  </nav>
  <!-- Close Header -->

  <!-- Modal -->
  <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="w-100 pt-1 mb-5 text-right">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="" method="get" class="modal-content modal-body">
        <div class="modal-content modal-body border-0 p-0">
          <div class="input-group mb-2">
            <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
            <button type="submit" class="input-group-text bg-util text-light">
              <i class="fa fa-fw fa-search text-white"></i>
            </button>
          </div>
      </form>
      <div class="row" id="resultBusqueda">

      </div>
    </div>

  </div>
  </div>