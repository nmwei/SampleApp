//
//  GTVideoViewController.m
//  SampleApp
//
//  Created by 倪梦威 on 2025/2/6.
//

#import "GTVideoViewController.h"

@interface GTVideoViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation GTVideoViewController

- (instancetype) init {
    self = [super init];
    if(self) {
    
        self.tabBarItem.title = @"视频";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    
    
    // 创建UICollectionView，需要设置layout
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame: self.view.bounds collectionViewLayout: flowLayout];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    //注册cell类，并关联一个重用标识符
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.view addSubview:collectionView];
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //优先从系统复用回收池取collectionView，如果没有才创建
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.item % 3 == 0) {
        return CGSizeMake(self.view.frame.size.width, 300);
    } else {
        return CGSizeMake((self.view.frame.size.width - 10) / 2, 300);
    }
}


@end
