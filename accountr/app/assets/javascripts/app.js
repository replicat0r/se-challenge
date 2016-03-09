

'use strict';
var sum = 0
  $(document).ready(function(){
  $('.monthly').find('.expense_total').each(function(){

  		sum += parseFloat($(this).text())
  		$(this).find('.totalsum').html('asd')
  		console.log(sum)
  })

  $('.modal-trigger').leanModal();

	$( '.inputfile' ).each( function()
	{
		var $input	 = $( this ),
			$label	 = $input.next( 'label' ),
			labelVal = $label.html();

		$input.on( 'change', function( e )
		{
			var fileName = '';

		  if( e.target.value ){
				fileName = e.target.value.split( '\\' ).pop();
		  }

			if( fileName )
				$label.find( 'span' ).html( fileName );
			else
				$label.html( labelVal );

		});

		$input
		.on( 'focus', function(){ $input.addClass( 'has-focus' ); })
		.on( 'blur', function(){ $input.removeClass( 'has-focus' ); });
	});
})