
document.addEventListener('turbolinks:load', () => {
    //ここにjsの記述を追加
    $('.question1').on('click', function() {
        $('#question1').addClass('invisible');
        $('#question2').removeClass('invisible');
    })

    $('.question2').on('click', function() {
        $('#question2').addClass('invisible');
        $('#question3').removeClass('invisible');
    })
    $('.question3').on('click', function() {
        $('#question3').addClass('invisible');
        $('#question4').removeClass('invisible');
    })
    $('.question4').on('click', function() {
        $('#question4').addClass('invisible');
        $('#question5').removeClass('invisible');
    })
    $('.question5').on('click', function() {
        $('#question5').addClass('invisible');
        $('#question6').removeClass('invisible');
    })
    $('.question6').on('click', function() {
        $('#question6').addClass('invisible');
        $('#question7').removeClass('invisible');
    })
    $('.question7').on('click', function() {
        $('#question7').addClass('invisible');
        $('#question8').removeClass('invisible');
    })
    $('.question8').on('click', function() {
        $('#question8').addClass('invisible');
        $('#question9').removeClass('invisible');
    })
    $('.question9').on('click', function() {
        $('#question9').addClass('invisible');
        $('.submit').removeClass('invisible');
    })

})
