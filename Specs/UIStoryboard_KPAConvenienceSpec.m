#import "SpecHelper.h"

#import "UIStoryboard+KPAConvenience.h"
#import "TestViewController.h"

SpecBegin(UIStoryboard_KPAConvenience)

describe(@"UIstoryboard+KPAConvience", ^{
    it(@"can set the main storyboard", ^{
        [UIStoryboard setMainStoryboardName:@"Main" bundle:[NSBundle bundleForClass:self.class]];
        expect([UIStoryboard mainStoryboard]).toNot.beNil();
    });

    it(@"knows storyboard identifiers for a class", ^{
        NSString *identifier = [UIStoryboard storyboardIdentifierForClass:[TestViewController class]];
        expect(identifier).to.equal(@"TestViewController");
    });

    it(@"can instantiate view controllers by class", ^{
        UIViewController *viewController = [[UIStoryboard mainStoryboard] instantiateViewControllerForClass:[TestViewController class]];
        expect(viewController).to.beKindOf([TestViewController class]);
    });

    it(@"knows segue identifier for a class", ^{
        NSString *segueIdentifier = [UIStoryboard segueIdentifierForClass:[TestViewController class]];
        expect(segueIdentifier).to.equal(@"TestViewControllerSegue");
    });
});

SpecEnd
