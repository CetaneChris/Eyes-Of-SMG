<?php
/*
 *   CC BY-NC-AS UTA FabLab 2016-2017
 *   FabApp V 0.9
 */

/**
 * Description of Devices
 *
 * @author Jon Le
 */


class theaters {
    private $theater_id;
    private $status;
    
    public function __construct($theater_id) {
        global $mysqli;
        $this->theater_id = $theater_id;
        
        
        if ($result = $mysqli->query("
             SELECT *
             FROM Theaters
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
    
    public static function printDot(){
    	//look up current device status
    	$dot = 0;
    	$color = "white";
    	$symbol = "circle";

    	if($status == NULL || $dot == 0)
			$color = "green";
		elseif($dot < 7)
			$color = "yellow";
		else{
			$color = "red";
			$symbol = "times";
		}
    	echo "<td><i class='fa fa-".$symbol." fa-fw' style='color:".$color."'></i>&nbsp; " . $theater_id . "</td>";
    }
    
}
