import XCTest
import Reloaded


class ReloadedTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        Setup.do()
    }
    
    override func tearDown() {
        Setup.clean()
        
        super.tearDown()
    }
    
    func testCreate() {
        let loco = try! Locomotive.new()
        loco.color = "brown"
        try! loco.save()
        
        var count = try! Locomotive.count()
        XCTAssertEqual(count, 51, "There has to be 50 beautiful locomotives")
        
        count = try! Locomotive.query.filter("color" == "brown").count()
        XCTAssertEqual(count, 1, "There has to be 1 beautiful brown locomotive")
    }
    
    func testFirst() {
        var loco = try! Locomotive.new()
        loco.color = "brown"
        loco.hasChimney = true
        try! loco.save()
        
        loco = try! Locomotive.new()
        loco.color = "brown"
        loco.hasChimney = false
        try! loco.save()
        
        let object = try! Locomotive.query.filter("color" == "brown").sort(by: "hasChimney").first()!
        XCTAssertEqual(object.hasChimney, false, "Wrong locomotive :(")
    }
    
    func testCount() {
        var count = try! Locomotive.count()
        XCTAssertEqual(count, 50, "There has to be 50 beautiful locomotives")
        
        count = try! Locomotive.query.filter("hasChimney" == true).count()
        XCTAssertEqual(count, 25, "There has to be 25 beautiful locomotives")
    }
    
    func testAll() {
        var objects = try! Locomotive.all()
        XCTAssertEqual(objects.count, 50, "There has to be 50 beautiful locomotives")
        
        objects = try! Locomotive.query.filter("hasChimney" == true).all()
        XCTAssertEqual(objects.count, 25, "There has to be 25 beautiful locomotives")
    }
    
    func testDeleteAll() {
        try! Locomotive.deleteAll()
        let objects = try! Locomotive.all()
        XCTAssertEqual(objects.count, 0, "There has to be no beautiful locomotive")
    }
    
    func testOperators() {
        // Bool
        var objects = try! Locomotive.query.filter("hasChimney" == true).all()
        XCTAssertEqual(objects.count, 25, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("hasChimney" != true).all()
        XCTAssertEqual(objects.count, 25, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("hasChimney" == false).all()
        XCTAssertEqual(objects.count, 25, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("hasChimney" != false).all()
        XCTAssertEqual(objects.count, 25, "Wrong number of beautiful locomotives in the result")
        
        // Strings
        objects = try! Locomotive.query.filter("color" == "green").all()
        XCTAssertEqual(objects.count, 5, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("color" == "GREEN").all()
        XCTAssertEqual(objects.count, 0, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("color" ==* "green").all()
        XCTAssertEqual(objects.count, 5, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("color" ==* "GREEN").all()
        XCTAssertEqual(objects.count, 5, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("color" != "green").all()
        XCTAssertEqual(objects.count, 45, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("color" != "GREEN").all()
        XCTAssertEqual(objects.count, 50, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("color" !=* "green").all()
        XCTAssertEqual(objects.count, 45, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("color" !=* "GREEN").all()
        XCTAssertEqual(objects.count, 45, "Wrong number of beautiful locomotives in the result")
        
        // Contains
        
        objects = try! Locomotive.query.filter("color" ~~ "gre").all()
        XCTAssertEqual(objects.count, 5, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("color" ~~ "GRE").all()
        XCTAssertEqual(objects.count, 0, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("color" ~~* "gre").all()
        XCTAssertEqual(objects.count, 5, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("color" ~~* "GRE").all()
        XCTAssertEqual(objects.count, 5, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("color" ~~ "ree").all()
        XCTAssertEqual(objects.count, 5, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("color" ~~ "REE").all()
        XCTAssertEqual(objects.count, 0, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("color" ~~* "ree").all()
        XCTAssertEqual(objects.count, 5, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("color" ~~* "REE").all()
        XCTAssertEqual(objects.count, 5, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("color" ~~ "reen").all()
        XCTAssertEqual(objects.count, 5, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("color" ~~ "REEn").all()
        XCTAssertEqual(objects.count, 0, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("color" ~~* "reen").all()
        XCTAssertEqual(objects.count, 5, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("color" ~~* "REEn").all()
        XCTAssertEqual(objects.count, 5, "Wrong number of beautiful locomotives in the result")
        
        // Bigger and smaller then
        
        objects = try! Locomotive.query.filter("hasChimney" > 0, "color" == "red").all()
        XCTAssertEqual(objects.count, 2, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("hasChimney" >= 0, "color" == "red").all()
        XCTAssertEqual(objects.count, 5, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("hasChimney" < 1, "color" == "red").all()
        XCTAssertEqual(objects.count, 3, "Wrong number of beautiful locomotives in the result")
        
        objects = try! Locomotive.query.filter("hasChimney" <= 1, "color" == "red").all()
        XCTAssertEqual(objects.count, 5, "Wrong number of beautiful locomotives in the result")
    }
    
}
