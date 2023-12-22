access(all) contract SomeContract {
    pub var testStruct: SomeStruct

    pub struct SomeStruct {

        //
        // 4 Variables
        //

        pub(set) var a: String // Read/Write: AREA 1, AREA 4

        pub var b: String // Read/Write: AREA 1, AREA 4

        access(contract) var c: String // Read: AREA 1, AREA 2, AREA 3, AREA 4  // Write: AREA 1, AREA 4

        access(self) var d: String // Read/Write: AREA 1, AREA 4

        //
        // 3 Functions
        //

        pub fun publicFunc() {} // Callable: AREA 1, AREA 2, AREA 3, AREA 4

        access(contract) fun contractFunc() {} // Callable: AREA 1, AREA 2, AREA 3, AREA 4

        access(self) fun privateFunc() {} // Callable: AREA 1, AREA 4

        pub fun structFunc() {
            /**************/
            /*** AREA 1 ***/
            /**************/

            // Can read and modify all variables and call all functions in this area.
        }

        init() {
            self.a = "a"
            self.b = "b"
            self.c = "c"
            self.d = "d"
        }
    }

    pub resource SomeResource {
        pub var e: Int // Read/Write: AREA 2

        pub fun resourceFunc() {
            /**************/
            /*** AREA 2 ***/
            /**************/

            // Can Read : c
            // Can Write : None
            // Can call : publicFun() & contractFunc() 
        }

        init() {
            self.e = 17
        }
    }

    pub fun createSomeResource(): @SomeResource {
        return <- create SomeResource()
    }

    pub fun questsAreFun() {
        /**************/
        /*** AREA 3 ****/
        /**************/
        
        // Can Read : c
        // Can Write : None
        // Can call : publicFun() & contractFunc() 
    }

    init() {
        self.testStruct = SomeStruct()
    }
}
