describe('Try to login into facebook.', function() {
    it('sholud login to facebook', function() {

        // use 
        browser.ignoreSynchronization = true;

        browser.get('https://www.facebook.com/');

        element(by.id('email')).sendKeys('email');
        element(by.id('pass')).sendKeys('password');
        element(by.id('loginbutton')).click();

        console.log("jizz");

        element(by.css("textarea")).sendKeys("QCLone test!");
        element(by.css("li > button[type='submit']")).click();

        // -----

        // need modify, just copy from example
        var todoList = element.all(by.repeater('todo in todoList.todos'));
        expect(todoList.count()).toEqual(3);
        expect(todoList.get(2).getText()).toEqual('write first protractor test');

        // You wrote your first test, cross it off the list
        todoList.get(2).element(by.css('input')).click();
        var completedAmount = element.all(by.css('.done-true'));
        expect(completedAmount.count()).toEqual(2);
    }, 100000);
});
