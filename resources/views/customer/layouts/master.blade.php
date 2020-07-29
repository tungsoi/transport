<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>{{ config('admin.name') }}</title>

    <!-- Bootstrap core CSS -->
    <link href="{{ asset('rongdo/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="{{ asset('rongdo/fontawesome-free/css/all.min.css') }}" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="{{ asset('vendor/laravel-admin/font-awesome/css/font-awesome.min.css') }}">
    
    <!-- Custom styles for this template -->
    <link href="{{ asset('rongdo/app/clean-blog.min.css') }}" rel="stylesheet">

    @yield('style')
    <style>
        .logo-img {
            max-width: 40px;
        }
        .mg-auto {
            margin: 0 auto;
        }
        #search-form .btn {
            padding: 5px 10px;
            font-size: 12px;
            border-radius: 5px;
            text-align: center;
            font-weight: 500;
            margin-right: 10px;
        }
        #login-form .btn, #register-form .btn {
            padding: 5px 10px;
            font-size: 12px;
            border-radius: 5px;
            text-align: center;
            font-weight: 500;
            margin-right: 10px;
        }
        #search-form label {
            font-weight: 500;
        }
        #search-form .col-md-3 {
            padding: 0px;
        }

        #search-form input[type="text"] {
            height: calc(1em + .375rem + 6px) !important;
            padding: .125rem 0.5rem !important;
            font-size: 14px !important;
            border-radius: 0px;
        }

        body {
            font-size: 14px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .mg-t-20 {
            margin-top: 50px;
        }
        #tbl_search_result th  {
            text-transform: uppercase;
            font-size: 12px;
        }
        header.masthead .page-heading, header.masthead .post-heading, header.masthead .site-heading {
            padding: 120px 0px 50px 0px;
        }
        .badge {
            font-size: 100%;
            color: white;
            font-weight: 400;
            padding: 10px;
        }
        .bg-green {
            background: #40a0a0;
        }

        .bg-red {
            background: #dc9006;
        }
        #tbl_search_result td p {
            margin: 5px;
        }
        .uppercase {
            text-transform: uppercase;
        }
        .tx-center {
            text-align: center;
        }
        .tx-heading {
            margin: 20px;
        }
    </style>
</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href="/" target="_blank">
                <img src="{{ asset('rongdo/img/logo.png') }}" alt="" class="logo-img"> &nbsp; RỒNG ĐỎ LOGISTICS
            </a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('admin.login') }}">Đăng nhập</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('customer.register') }}">Đăng ký</a>
                </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Page Header -->
    <header class="masthead" style="background-image: url('{{ asset('rongdo/img/about-bg.jpg') }}')">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 mx-auto">
                    <div class="page-heading">
                        <h2>GIÚP HÀNG TRIỆU KHÁCH HÀNG DOANH NGHIỆP</h2> <hr>
                        <h2>NHẬP HÀNG TẬN GỐC</h2>
                        <h3>NGUỒN HÀNG UY TÍN THẾ GIỚI</h3>
                        <br><br>
                        <h5>Kho Sài Gòn: 0977777324 | Kho Hà Nội: 0971226605</h5>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    @yield('content')
    
    <footer>
        <div class="container">
            <hr>
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                <p class="copyright text-muted">{{ config('admin.copyright') }}</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="{{ asset('rongdo/jquery/jquery.min.js') }}"></script>
    <script src="{{ asset('rongdo/bootstrap/js/bootstrap.bundle.min.js') }}"></script>

    <!-- Custom scripts for this template -->
    <script src="{{ asset('rongdo/app/clean-blog.min.js') }}"></script>

    @yield('script')
</body>
</html>
