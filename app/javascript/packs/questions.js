
document.addEventListener('turbolinks:load', () => {
    console.log(document.getElementById('hello'));
    //ここにjsの記述を追加
    $('.question1').on('click', function() {
        $('#question1').addClass('invisible')
        $('#question2').removeClass('invisible');
    })
})
