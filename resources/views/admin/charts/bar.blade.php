<div style="background: white;">
    <center>
        <div class="row">
            <div class="col-md-12" id="chart-month">
                <canvas id="myChart" style="max-width: 1000px;"></canvas>
                <br>
                <p>{{ $title }}</p>
            </div>
        </div>
    </center>
</div>
<input type="hidden" name="title" value="{{ $title }}">
<input type="hidden" name="data" value="{{ $data }}">
<script>
$(function () {
    var ctx = document.getElementById("myChart").getContext('2d');
    var dataStr = $('input[name="data"]').val();    
    var dataArr = dataStr.split(',');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["Thang 1", "Thang 2", "Thang 3", "Thang 4", "Thang 5", "Thang 6", "Thang 7", "Thang 8", "Thang 9", "Thang 10", "Thang 11", "Thang 12"],
            datasets: [{
                label: $('input[name="title"]').val(),
                data: dataArr,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',  
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true,

                        callback: function(value, index, values) {
                            if(parseInt(value) > 999){
                                return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' VND';
                            } else if (parseInt(value) < -999) {
                                return Math.abs(value).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' VND';
                            } else {
                                return value + ' VND';
                            }
                        }
                    }
                }]
            }
        }
    });
});
</script>