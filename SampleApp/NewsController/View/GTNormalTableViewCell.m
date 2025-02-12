//
//  GTNormalTableViewCell.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/6.
//

#import "GTNormalTableViewCell.h"
#import "GTListItem.h"
#import "SDWebImage.h"
#import"GTScreen.h"

@interface GTNormalTableViewCell()

@property(nonatomic, strong, readwrite) UILabel *titleLabel; // nonatomic不是线程安全的,strong 目标对象持有强引用, readwrite 可以读取也可以修改的
@property(nonatomic, strong, readwrite) UILabel *sourceLabel;
@property(nonatomic, strong, readwrite) UILabel *commendLabel;
@property(nonatomic, strong, readwrite) UILabel *timeLabel;

@property(nonatomic, strong, readwrite) UIImageView *rightImageView;
@property(nonatomic, strong, readwrite) UIButton *deleteButton;

@end

@implementation GTNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if(self) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame: UIRect(20, 15, 270, 50)];
            self.titleLabel.font = [UIFont systemFontOfSize: 16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel.numberOfLines = 2;
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] init];
            self.sourceLabel.font = [UIFont systemFontOfSize: 12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        
        [self.contentView addSubview:({
            self.commendLabel = [[UILabel alloc] init];
            self.commendLabel.font = [UIFont systemFontOfSize: 12];
            self.commendLabel.textColor = [UIColor grayColor];
            self.commendLabel;
        })];
        
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] init];
            self.timeLabel.font = [UIFont systemFontOfSize: 12];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
        
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:UIRect(300, 15, 70, 70)];
            self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
            self.rightImageView;
        })];
        
        [self.contentView addSubview:({
            self.deleteButton = [[UIButton alloc] initWithFrame:UIRect(250, 80, 30, 20)];
            [self.deleteButton setTitle:@"X" forState:UIControlStateNormal]; //普通显示
            [self.deleteButton setTitle:@"V" forState:UIControlStateHighlighted]; //点击的时候显示
            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
            
            self.deleteButton.layer.cornerRadius = 10;
            self.deleteButton.layer.masksToBounds = YES; //子视图如果超出了父视图,超出部分不可见
            self.deleteButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
            self.deleteButton.layer.borderWidth = 2;
            
            self.deleteButton.backgroundColor = [UIColor blueColor];
            self.deleteButton;
        })];
    }
    return self;
}

- (void) layoutTableViewCellWithItem:(GTListItem *)item {
    BOOL hasRead = [[NSUserDefaults standardUserDefaults]boolForKey:item.uniquekey];
    if(hasRead) {
        self.titleLabel.textColor = [UIColor lightGrayColor];
    } else {
        self.titleLabel.textColor = [UIColor blackColor];
    }
    
    self.titleLabel.text = item.title;
    
    self.sourceLabel.text = item.authorName;
    [self.sourceLabel sizeToFit];
    self.sourceLabel.frame = CGRectMake(
        20,
        70,
        self.sourceLabel.frame.size.width,
        self.sourceLabel.frame.size.height
    );
    
    self.commendLabel.text =item.category;
    [self.commendLabel sizeToFit];
    

    self.commendLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x +
        self.sourceLabel.frame.size.width + UI(15),
        70,
        self.commendLabel.frame.size.width,
        self.commendLabel.frame.size.height
    );
    
    self.timeLabel.text = item.date;
    [self.timeLabel sizeToFit];
    
    self.timeLabel.frame = CGRectMake(self.commendLabel.frame.origin.x +
        self.commendLabel.frame.size.width + UI(15),
        70,
        self.timeLabel.frame.size.width,
        self.timeLabel.frame.size.height
    );
  
//    NSThread *downloadImageThread = [[NSThread alloc]initWithBlock:^{
//        NSString *url = @"https://p5.img.cctvpic.com/photoworkspace/2020/07/19/2020071917201287710.png";
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
//        self.rightImageView.image = image;
//    }];
//
//    downloadImageThread.name = @"downloadImageThread";
//    [downloadImageThread start];
    
    //获取全局队列
//    dispatch_queue_global_t downloadQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    //获取主队列
//    dispatch_queue_main_t mainQueue = dispatch_get_main_queue();
//
//    //在全局队列异步执行加载图片
//    dispatch_async(downloadQueue, ^{
//        NSString *url = @"https://p5.img.cctvpic.com/photoworkspace/2020/07/19/2020071917201287710.png";
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
//        //在主队列异步执行图片显示
//        dispatch_async(mainQueue, ^{
//            self.rightImageView.image = image;
//        });
//    });
    
    NSString *url = @"https://p5.img.cctvpic.com/photoworkspace/2020/07/19/2020071917201287710.png";
    
    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            NSLog(@"");
    }];
    
}

- (void) deleteButtonClick {
    //检查 self.delegate 是否实现了名为 tableViewCell:clickDeleteButton: 的方法，以确保在调用委托方法之前是安全的
    if(self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell: clickDeleteButton:)]) {
        [self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
    }
}


@end


