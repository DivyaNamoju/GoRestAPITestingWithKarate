Feature: Read different JSON

  Scenario: Read and print values of a  simple JSON
    * def jsonData =
    """
    {"name":"John", "age":30, "car":null}
    """
    * print jsonData.name
    * print jsonData.age
    * print jsonData.car

  Scenario: Read and print values of a complex JSON - 1
    * def jsonData =
    """
    {First: [11, 12, 13, 14, 15],
    Second: [21, 22, 23],
    Third: [31, 32,33]}
    """
    * print jsonData.First[1]
    * print jsonData.Second[2]
    * print jsonData.Third[2]

  Scenario: Read and print values of a complex JSON - 2
    * def jsonData =
    """
    {
	"id": "1",
	"type": "icecream",
	"name": "Vanilla Cone",
	"image":
		{
			"url": "img/01.png",
			"width": 200,
			"height": 200
		},
	"thumbnail":
		{
			"url": "images/thumbnails/01.png",
			"width": 32,
			"height": 32
		}
    }
    """
    * print jsonData.image.url
    * print jsonData.thumbnail.url
    * print jsonData
