<?php 


function listFiles($dir,$exclude){ 
	$i = 0;
	$files = array();
    $ffs = scandir($dir); 
/*     echo '<ul class="ulli">';  */
    foreach($ffs as $ff){ 
        if(is_array($exclude) and !in_array($ff,$exclude)){ 
            if($ff != '.' && $ff != '..'){ 
	            if(!is_dir($dir.'/'.$ff)){ 
	            	$ext = explode('.', $ff);
	            	if (in_array(end($ext), array('jpg', 'png'))) {
		            	$i++;
		            	array_push($files, array(
		            		'title' => 'Wallpaper '. $i,
		            		'file' => $ff
		            	));
		            }
	            } 
            } 
        } 
    } 
    return $files;
} 


$wallpapers = listFiles('wallpapers', array('.'));
$result = json_encode($wallpapers);

echo $result;