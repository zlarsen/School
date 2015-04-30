Node.js/NPM
Express/Generator
Jade
MongoDB
Mongoose


### Final

*Use Classroom computer
*Practical Exam
*50% PHP fundamentals
*50% Frameworks

#### Resources
*Everything


### Review

#### Slim

*slimframework.com
*`mkdir slim-exam`
*`curl -sS https://getcomposer.org/installer | php`
* Inside of slim-exam `php composer.phar require slim/slim`
* vim index.php
* paste in <?php
require 'vendor/autoload.php';
$app = new \Slim\Slim();
$app->get('/hello/:name', function ($name) {
    echo "Hello, $name";
});
$app->run();
?>

#### Go

https://github.com/go-martini/martini

package main

import "github.com/go-martini/martini"
import "github.com/martini-contrib/render"
func main() {
  m := martini.Classic()
  m.Use(render.Renderer())
  m.Get("/hello/:name", func(params martini.Params, r render.Render) {
  	r.HTML(200, "hello", params["name"])   
 	//return "Hello " + params["name"]
  })
  m.Run()
}
PORT=4212 go run server.go
`mkdir templates`
`touch templates/hello.tmpl`
Hello, {{.}}!

#### Databases

`ssh desdemona`
`mysql -h mysql -p`
```
CREATE TABLE widgets (
 id INT PIRMARY KEY AUTO_INCREMENT,
 name VARCHAR(255),
 age INT);

```

`INSERT INTO widgets (name, age) VALUES ("DJ", 27);`



