<?php
/*
	Description of Theaters
 */


class theaters {
    private $theater_id;
    private $status;
    
    public function __construct($theater_id) {
        global $mysqli;
        $this->theater_id = $theater_id;
        
        
        if ($result = $mysqli->query("
             SELECT *
             FROM theaters
             WHERE `theater_id` = '$theater_id';
        ")){
            $row = $result->fetch_assoc();
            
            $this->setID($row['theater_id']);
            $this->setStatus($row['status']);
            $result->close();
        } else
            throw new Exception("Invalid Theater ID");
    }
    
/*    public static function regexDID($d_id){           //TODO convert to regex theater ID
		global $mysqli;
        if (preg_match("/^\d+$/", $d_id) == 0){
            echo "Invalid D ID.";
            return false;
        }
        
        //Check to see if device exists
        if ($result = $mysqli->query("
            SELECT *
            FROM `devices`
            WHERE `d_id` = '$d_id'
            LIMIT 1;
        ")){
            if ($result->num_rows == 1)
                return true;
            return false;
        } else {
            return false;
        }
    }
    
    public static function regexDeviceID($device_id){
        if (preg_match("/^\d{4}$/", $d_id) == 0){
            echo "Invalid Device ID. ";
            return false;
            
        }//Check to see if device exists
        if ($result = $mysqli->query("
            SELECT *
            FROM `devices`
            WHERE `device_id` = '$device_id'
            LIMIT 1;
        ")){
            if ($result->num_rows == 1)
                return true;
            return false;
        } else {
            return false;
        }
    }*/
    
    public function getTheater_id() {
        return $this->theater_id;
    }

    public function getStatus() {
        return $this->status;
    }
    
/*    public function getDg_Name(){     //Convert to get movie name?
        global $mysqli;
        
        if($result = $mysqli->query("
            SELECT `dg_name`
            FROM `device_group`
            WHERE `dg_id` = '".$this->dg_id."'
            LIMIT 1;
        ")){
            $row = $result->fetch_assoc();
            return $row['dg_name'];
        }
        return "Not Found";
    }*/
    
    public function setTheater_id($theater_id) {
//        if (preg_match("/^\d+$/",$device_id) == 0)    //TODO update
 //           return false;
        $this->theater_id = $theater_id;
    }

    public function setStatus($status) {
        $this->status = $status;
    }
    
    public static function printDot($theater_id){
    	global $mysqli;
    	//look up current theater status
    	$color = "white";
    	$symbol = "circle";
    	
    	$select = "SELECT * FROM theaters WHERE ID = " . $theater_id;

    	if($status = $mysqli->query($select)){
    		$status = $status->fetch_assoc();
	    	if($status['STATUS'] == 1)
				$color = "black";
	    	elseif($status['STATUS'] == 2){
	    		$symbol = "check";
				$color = "green";
	    	}elseif($status['STATUS'] == 3){
				$color = "red";
				$symbol = "times";
			}
    	}
    	echo "<td align = 'center'><i class='fas fa-".$symbol." fa-fw' style='color:".$color."'></i>&nbsp; " . $theater_id . "</td>";
    }
    
    public static function printKey($theater_id){
/*    	global $mysqli;
    	//look up current theater status
    	$color = "white";
    	$symbol = "circle";
    	 
    	$select = "SELECT * FROM THEATERS WHERE ID = " . $theater_id;
    
    	if($status = $mysqli->query($select)){
    		$status = $status->fetch_assoc();
    		if($status['STATUS'] == 1)
    			$color = "black";
    			elseif($status['STATUS'] == 2){
    				$symbol = "check";
    				$color = "green";
    			}elseif($status['STATUS'] == 3){
    				$color = "red";
    				$symbol = "times";
    			}
    	}
    	echo "<td align = 'center'><i class='fas fa-".$symbol." fa-fw' style='color:".$color."'></i>&nbsp; " . $theater_id . "</td>";*/
    }
    
}
