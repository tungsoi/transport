<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ Admin::title() }} @if($header) | {{ $header }}@endif</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    @if(!is_null($favicon = Admin::favicon()))
        <link rel="shortcut icon" href="{{$favicon}}">
    @endif

    {!! Admin::css() !!}

    <script src="{{ Admin::jQuery() }}"></script>
    {!! Admin::headerJs() !!}

    <style>
        body {
            font-family: "Tahoma" !important;
            font-size: 12px !important;
        }
        
        h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {
            font-family: "Tahoma" !important;
        }
        .content-header>h1 {
            text-transform: uppercase;
            font-size: 20px;
        }
        .editable-click, a.editable-click, a.editable-click:hover {
            border-bottom: none !important;
        }
        .uppercase {
            text-transform: uppercase;
        }
        #tbl_payment {
            background: white;
        }
        #tbl_payment tr th {
            font-size: 18px;
        }
        #tbl_payment tbody tr:first-child td {
            font-weight: bold;
        }

        #tbl_payment tbody tr td:nth-child(4), #tbl_payment tbody tr td:nth-child(5) {
            text-align: right;
        }
        .input-group label.error {
            display: table-caption;
            color: red;
            font-weight: 400;
        }
    </style>
</head>

<body class="hold-transition {{config('admin.skin')}} {{join(' ', config('admin.layout'))}}">

@if($alert = config('admin.top_alert'))
    <div style="text-align: center;padding: 5px;font-size: 12px;background-color: #ffffd5;color: #ff0000;">
        {!! $alert !!}
    </div>
@endif

<div class="wrapper">

    @include('admin::partials.header')

    @include('admin::partials.sidebar')

    <div class="content-wrapper" id="pjax-container">
        {!! Admin::style() !!}
        <div id="app">
        @yield('content')
        </div>
        {!! Admin::script() !!}
        {!! Admin::html() !!}
    </div>

    @include('admin::partials.footer')

</div>

<button id="totop" title="Go to top" style="display: none;"><i class="fa fa-chevron-up"></i></button>

<script>
    function LA() {}
    LA.token = "{{ csrf_token() }}";
    LA.user = @json($_user_);
</script>

<!-- REQUIRED JS SCRIPTS -->
{!! Admin::js() !!}

<script src="{{ asset('rongdo/autoNumeric.js') }}"></script>
<script src="{{ asset('rongdo/jquery/jquery.validate.js') }}"></script>
</body>
</html>
