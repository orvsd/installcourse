<?php  

// This file is NOT a part of Moodle - http://moodle.org/
//
// This client for Moodle 2 is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//

/**
* REST client for Moodle 2
* Return JSON or XML format
*
* @authorr Jerome Mouneyrac
*/

/// SETUP - NEED TO BE CHANGED
$token = '13f6df8a8b66742e02f7b3791710cf84';
$domainname = 'http://lamp/moodle';
$functionname = 'local_orvsd_create_course';

// REST RETURNED VALUES FORMAT
$restformat = 'json'; //Also possible in Moodle 2.2 and later: 'json'
                     //Setting it to 'json' will fail all calls on earlier Moodle version

//////// moodle_user_create_users ////////

/// PARAMETERS - NEED TO BE CHANGED IF YOU CALL A DIFFERENT FUNCTION
$course1 = array();
$course1['filepath'] = '/ORVSD/';
$course1['file'] = 'Algebra1honors14.mbz';
$course1['firstname'] = 'testfirstname';
$course1['lastname'] = 'testlastname';
$course1['username'] = 'testusername';
$course1['email'] = 'bob@bob.com';
$course1['pass'] = 'password123';
$params = array('course1' => $course1);

print "Calling the REST server with parameters:\n";
print_r($course1);

/// REST CALL
//header('Content-Type: text/plain');
$serverurl = $domainname . '/webservice/rest/server.php'. '?wstoken=' . $token . '&wsfunction='.$functionname;
require_once('./curl.php');
$curl = new curl;
//if rest format == 'xml', then we do not add the param for backward compatibility with Moodle < 2.2

$restformat = ($restformat == 'json')?'&moodlewsrestformat=' . $restformat:'';
$resp = $curl->post($serverurl . '&moodlewsrestformat=json', $course1);
print_r($resp);
