function calc(){
    let currentSum = $('#currentSum').val();
    let calcSum = $('.calcSum').text();
    let dollarText = $('.dollar-text');
    let dollarIcon = $('.warning-dollar');
    let percentIcon = $('.warning-percent');
    let percentText = $('.percent-text');
    let resultText = $('#resultText');
    let color = $('.color-text');
    let finalResult = +currentSum - +calcSum;
    dollarText.html(finalResult + '/ qtr');

    if(finalResult > 0){
        color.css('color','#0FC679');
        dollarIcon.removeClass('warning-dollar').addClass('success-dollar');
        percentIcon.removeClass('warning-percent').addClass('success-percent');
        resultText.text('Your fees are lower than expected by:');
        percentText.text( percentage(finalResult, +calcSum))

    }else{
        color.css('color', '#EC2819');
        $('.success-dollar').removeClass('success-dollar').addClass('warning-dollar');
        $('.success-percent').removeClass('success-percent').addClass('warning-percent');
        resultText.text('Your fees are higher than expected by:');

        percentText.text( percentage(finalResult, +calcSum))
    }

}
$('#calculate').click(function (e) {
    e.preventDefault();
    calc()
});

function percentage(partialValue, totalValue) {
    let res = (100 * partialValue) / totalValue;
    return res.toFixed(1)
}