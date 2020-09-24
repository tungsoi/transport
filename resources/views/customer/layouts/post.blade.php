@extends('customer.layouts.master')

@section('content')
    <div class="container" id="container-transport">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center uppercase">{{ $post->title }}</h2>
                <hr>
                {!! $post->content !!}
            </div>
        </div>
    </div>
@endsection