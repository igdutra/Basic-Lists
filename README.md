# Basic-Lists
Basic List of products

Explore the branches to see the same project written in different forms:

1. **mvc-XIB**:  
   * All views used XIB (Mac OS X Interface Builder) and Model-View-Controller architecture. 
   * No Storyboard was used.
2. **mvc-ViewCode**:  
    * Replace all .xib files for view code. Keep MVC architecture. 
    * TableView Delegates are inside ViewController
3. **mvvm-ViewCode**:  
    * First try with Model-View-ViewModel architecture. 
    * ViewController is now only responsable for instantiating both View and ViewModel
4. **mvvm-dependencyInjection**:  
    * Services and Delegates use protocol, which reduces coupling
5. **unitTests**:  
    * Unit tests for ViewModel, Service and TableViewCell using Mocks
6. **uiTests**:
    * Basic UI Test for a Label and a tap
7. **mvvm-improvement**:
    * A View should not hold reference to the Model. Some properties are now private, exposing public methods 
