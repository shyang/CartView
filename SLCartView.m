//
//  SLCartView.m
//  SLMobile
//
//  Created by shaohua on 12/5/13.
//
//

#import "SLCartView.h"

@implementation SLCartView {
    UILabel *_badgeLbl;
    UIView *_blurView;
    UIView *_tagView;
    int _count;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:CGRectMake(0, 0, 22, 22)]) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
        imageView.image = [UIImage imageNamed:@"Cart"];
        [self addSubview:imageView];

        _blurView = [[UIView alloc] init];
        _blurView.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:.8];
        [self addSubview:_blurView];

        // 27x18
        _tagView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Tag"]];
        _tagView.alpha = 0;
        _tagView.center = CGPointMake(_tagView.center.x, self.bounds.size.height / 2);
        [self addSubview:_tagView];

        _badgeLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 22, 18)];
        _badgeLbl.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _badgeLbl.backgroundColor = [UIColor clearColor];
        _badgeLbl.textColor = [UIColor whiteColor];
        _badgeLbl.font = [UIFont systemFontOfSize:12];
        _badgeLbl.text = @"2";
        _badgeLbl.textAlignment = NSTextAlignmentCenter;
        [_tagView addSubview:_badgeLbl];
    }
    return self;
}

- (void)setObject:(int)count animated:(BOOL)animated {
    _tagView.hidden = _badgeLbl.hidden = count == 0;

    if (count == 0 || count == _count) {
        return;
    }
    _count = count;

    if (!animated) {
        _badgeLbl.text = [@(count) description];
        return;
    }

    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    anim.fromValue = @(.5);
    anim.toValue = @(22);
    anim.duration = 1;
    [_blurView.layer addAnimation:anim forKey:@"keepAsCircle"];

    _blurView.frame = CGRectMake(11, 11, 1, 1);
    _blurView.alpha = 1;
    _blurView.layer.cornerRadius = .5;
    [UIView animateWithDuration:anim.duration animations:^{
        _blurView.frame = CGRectInset(self.bounds, -11, -11);
        _blurView.alpha = 0.1;
    } completion:^(BOOL finished) {
        _blurView.alpha = 0;
        _tagView.alpha = 0;
        _tagView.frame = CGRectMake(-20, 2, 20, 18);
        [UIView animateWithDuration:.3 animations:^{
            _tagView.frame = CGRectMake(-27, 2, 27, 18);
            _tagView.alpha = 1;
            _badgeLbl.text = [@(count) description];
        }];
    }];
}

@end
