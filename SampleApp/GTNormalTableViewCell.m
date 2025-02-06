//
//  GTNormalTableViewCell.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/6.
//

#import "GTNormalTableViewCell.h"

@interface GTNormalTableViewCell()

@property(nonatomic, strong, readwrite) UILabel *titleLabel; // nonatomic不是线程安全的,strong 目标对象持有强引用, readwrite 可以读取也可以修改的
@property(nonatomic, strong, readwrite) UILabel *sourceLabel;
@property(nonatomic, strong, readwrite) UILabel *commendLabel;
@property(nonatomic, strong, readwrite) UILabel *timeLabel;


@end

@implementation GTNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if(self) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 300, 50)];
            //self.titleLabel.backgroundColor = [UIColor redColor];
            self.titleLabel.font = [UIFont systemFontOfSize: 16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] init];
            //self.sourceLabel.backgroundColor = [UIColor redColor];
            self.sourceLabel.font = [UIFont systemFontOfSize: 12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        
        [self.contentView addSubview:({
            self.commendLabel = [[UILabel alloc] init];
            //self.commendLabel.backgroundColor = [UIColor redColor];
            self.commendLabel.font = [UIFont systemFontOfSize: 12];
            self.commendLabel.textColor = [UIColor grayColor];
            self.commendLabel;
        })];
        
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] init];
            //self.timeLabel.backgroundColor = [UIColor redColor];
            self.timeLabel.font = [UIFont systemFontOfSize: 12];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
        
    }
    return self;
}

- (void) layoutTableViewCell {
    self.titleLabel.text = @"极客时间iOS开发";
    
    self.sourceLabel.text = @"极客时间";
    [self.sourceLabel sizeToFit];
    self.sourceLabel.frame = CGRectMake(
        20,
        80,
        self.sourceLabel.frame.size.width,
        self.sourceLabel.frame.size.height
    );
    
    self.commendLabel.text = @"1896评论";
    [self.commendLabel sizeToFit];
    

    self.commendLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x +
        self.sourceLabel.frame.size.width + 15,
        80,
        self.commendLabel.frame.size.width,
        self.commendLabel.frame.size.height
    );
    
    self.timeLabel.text = @"10小时前";
    [self.timeLabel sizeToFit];
    
    self.timeLabel.frame = CGRectMake(self.commendLabel.frame.origin.x +
        self.commendLabel.frame.size.width + 15,
        80,
        self.timeLabel.frame.size.width,
        self.timeLabel.frame.size.height
    );
}


@end


