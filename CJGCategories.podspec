#
# Be sure to run `pod lib lint CJGCategories.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#
#class MyCode
#def recursionDirCreateSubSpace(path1,space)
#    ignore = ['.','..','.DS_Store']
#
#    Dir.foreach(path1) do |file|
#
#        # p file  # 打印所有的file，需要忽略掉你不需要的
#        if ignore.include?(file) && file.length > 0
#            next
#        end
#
#        tmpPath = "#{path1}/#{file}"
#        # p tmpPath # 打印合理的路径，检测是否有不合理的记得过滤
#        if File::ftype(tmpPath) == "directory"
#            space.subspec file do |tmpS|
#                tmpS.source_files = "#{tmpPath}/*"
#                recursionDirCreateSubSpace(tmpPath,tmpS)
#            end
#        end
#    end
#end

Pod::Spec.new do |s|
  s.name             = 'CJGCategories'
  s.version          = '0.1.3'
  s.summary          = 'A short description of CJGCategories.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://www.baidu.com'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MackolChen' => 'chenjg@tiens.com' }
  s.source           = { :git => 'https://github.com/MackolChen/CJGCategories.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'
  s.source_files = 'CJGCategories/Classes/CJGCategories.h'
  s.public_header_files = 'CJGCategories/Classes/CJGCategories.h'
  #=========================CoreData==================================
  s.subspec 'CoreData' do |ss|
    ss.source_files = 'CJGCategories/Classes/CJGCoreData.h'
    ss.public_header_files = 'CJGCategories/Classes/CJGCoreData.h'
      ss.subspec 'NSManagedObject' do |sss|
        sss.source_files = 'CJGCategories/Classes/CoreData/NSManagedObject/**/*'
        sss.public_header_files = 'CJGCategories/Classes/CoreData/NSManagedObject/*.h'
        sss.dependency 'CJGCategories/CoreData/NSManagedObjectContext'
      end
      ss.subspec 'NSManagedObjectContext' do |sss|
        sss.source_files = 'CJGCategories/Classes/CoreData/NSManagedObjectContext/**/*'
        sss.public_header_files = 'CJGCategories/Classes/CoreData/NSManagedObjectContext/*.h'
        sss.dependency 'CJGCategories/CoreData/NSFetchRequest'
      end
      ss.subspec 'NSFetchRequest' do |sss|
        sss.source_files = 'CJGCategories/Classes/CoreData/NSFetchRequest/**/*'
        sss.public_header_files = 'CJGCategories/Classes/CoreData/NSFetchRequest/*.h'
      end
  end
  #=========================CoreLocation==================================
  s.subspec 'CoreLocation' do |ss|
    ss.source_files = 'CJGCategories/Classes/CJGCoreLocation.h'
    ss.public_header_files = 'CJGCategories/Classes/CJGCoreLocation.h'
      ss.subspec 'CLLocation' do |sss|
        sss.source_files = 'CJGCategories/Classes/CoreLocation/CLLocation/**/*'
        sss.public_header_files = 'CJGCategories/Classes/CoreLocation/CLLocation/*.h'
      end
  end
  #=========================Foundation==================================
  s.subspec 'Foundation' do |ss|
    ss.source_files = 'CJGCategories/Classes/CJGFoundation.h'
    ss.public_header_files = 'CJGCategories/Classes/CJGFoundation.h'
      ss.subspec 'NSDictionary' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSDictionary/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSDictionary/*.h'
      end
      ss.subspec 'NSHTTPCookieStorage' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSHTTPCookieStorage/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSHTTPCookieStorage/*.h'
      end
      ss.subspec 'NSBundle' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSBundle/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSBundle/*.h'
      end
      ss.subspec 'NSNotificationCenter' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSNotificationCenter/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSNotificationCenter/*.h'
      end
      ss.subspec 'NSException' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSException/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSException/*.h'
      end
      ss.subspec 'NSDateFormatter' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSDateFormatter/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSDateFormatter/*.h'
      end
      ss.subspec 'NSURLConnection' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSURLConnection/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSURLConnection/*.h'
      end
      ss.subspec 'NSFileManager' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSFileManager/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSFileManager/*.h'
      end
      ss.subspec 'NSFileHandle' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSFileHandle/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSFileHandle/*.h'
      end
      ss.subspec 'NSData' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSData/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSData/*.h'
      end
      ss.subspec 'NSURL' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSURL/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSURL/*.h'
      end
      ss.subspec 'NSIndexPath' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSIndexPath/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSIndexPath/*.h'
      end
      ss.subspec 'NSString' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSString/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSString/*.h'
        sss.dependency 'CJGCategories/Foundation/NSData'
      end
      ss.subspec 'NSInvocation' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSInvocation/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSInvocation/*.h'
      end
      ss.subspec 'NSArray' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSArray/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSArray/*.h'
      end
      ss.subspec 'NSURLRequest' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSURLRequest/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSURLRequest/*.h'
      end
      ss.subspec 'NSUserDefaults' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSUserDefaults/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSUserDefaults/*.h'
      end
      ss.subspec 'NSNumber' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSNumber/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSNumber/*.h'
      end
      ss.subspec 'NSTimer' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSTimer/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSTimer/*.h'
      end
      ss.subspec 'NSSet' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSSet/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSSet/*.h'
      end
      ss.subspec 'NSObject' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSObject/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSObject/*.h'
      end
      ss.subspec 'NSRunLoop' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSRunLoop/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSRunLoop/*.h'
      end
      ss.subspec 'NSDate' do |sss|
        sss.source_files = 'CJGCategories/Classes/Foundation/NSDate/**/*'
        sss.public_header_files = 'CJGCategories/Classes/Foundation/NSDate/*.h'
      end
  end
  #=========================MapKit==================================
  s.subspec 'MapKit' do |ss|
    ss.source_files = 'CJGCategories/Classes/CJGMapKit.h'
    ss.public_header_files = 'CJGCategories/Classes/CJGMapKit.h'
      ss.subspec 'MKMapView' do |sss|
        sss.source_files = 'CJGCategories/Classes/MapKit/MKMapView/**/*'
        sss.public_header_files = 'CJGCategories/Classes/MapKit/MKMapView/*.h'
      end
  end
      
  #=========================QuartzCore==================================
  s.subspec 'QuartzCore' do |ss|
    ss.source_files = 'CJGCategories/Classes/CJGQuartzCore.h'
    ss.public_header_files = 'CJGCategories/Classes/CJGQuartzCore.h'
      ss.subspec 'CAMediaTimingFunction' do |sss|
        sss.source_files = 'CJGCategories/Classes/QuartzCore/CAMediaTimingFunction/**/*'
        sss.public_header_files = 'CJGCategories/Classes/QuartzCore/CAMediaTimingFunction/*.h'
      end
      ss.subspec 'CAAnimation' do |sss|
        sss.source_files = 'CJGCategories/Classes/QuartzCore/CAAnimation/**/*'
        sss.public_header_files = 'CJGCategories/Classes/QuartzCore/CAAnimation/*.h'
      end
      ss.subspec 'CAShapeLayer' do |sss|
        sss.source_files = 'CJGCategories/Classes/QuartzCore/CAShapeLayer/**/*'
        sss.public_header_files = 'CJGCategories/Classes/QuartzCore/CAShapeLayer/*.h'
      end
      ss.subspec 'CALayer' do |sss|
        sss.source_files = 'CJGCategories/Classes/QuartzCore/CALayer/**/*'
        sss.public_header_files = 'CJGCategories/Classes/QuartzCore/CALayer/*.h'
      end
      ss.subspec 'CATransaction' do |sss|
        sss.source_files = 'CJGCategories/Classes/QuartzCore/CATransaction/**/*'
        sss.public_header_files = 'CJGCategories/Classes/QuartzCore/CATransaction/*.h'
      end
  end
  
  #=========================UIKit==================================
  s.subspec 'UIKit' do |ss|
    ss.source_files = 'CJGCategories/Classes/CJGUIKit.h'
    ss.public_header_files = 'CJGCategories/Classes/CJGUIKit.h'
      ss.subspec 'UIImage' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UIImage/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UIImage/*.h'
      end
      ss.subspec 'UILable' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UILable/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UILable/*.h'
      end
      ss.subspec 'UIScrollView' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UIScrollView/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UIScrollView/*.h'
      end
      ss.subspec 'UIScreen' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UIScreen/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UIScreen/*.h'
      end
      ss.subspec 'UIWindow' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UIWindow/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UIWindow/*.h'
      end
      ss.subspec 'UIApplication' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UIApplication/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UIApplication/*.h'
      end
      ss.subspec 'UITableViewCell' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UITableViewCell/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UITableViewCell/*.h'
      end
      ss.subspec 'UIResponder' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UIResponder/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UIResponder/*.h'
      end
      ss.subspec 'UIButton' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UIButton/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UIButton/*.h'
      end
      ss.subspec 'UIColor' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UIColor/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UIColor/*.h'
      end
      ss.subspec 'UIAlertView' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UIAlertView/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UIAlertView/*.h'
      end
      ss.subspec 'UISplitViewController' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UISplitViewController/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UISplitViewController/*.h'
      end
      ss.subspec 'UIView' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UIView/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UIView/*.h'
      end
      ss.subspec 'UIFont' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UIFont/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UIFont/*.h'
      end
      ss.subspec 'UINavigationItem' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UINavigationItem/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UINavigationItem/*.h'
      end
      ss.subspec 'UIDevice' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UIDevice/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UIDevice/*.h'
      end
      ss.subspec 'UIBarButtonItem' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UIBarButtonItem/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UIBarButtonItem/*.h'
      end
      ss.subspec 'UIBezierPath' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UIBezierPath/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UIBezierPath/*.h'
      end
      ss.subspec 'UIImageView' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UIImageView/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UIImageView/*.h'
      end
      ss.subspec 'UINavigationBar' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UINavigationBar/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UINavigationBar/*.h'
      end
      ss.subspec 'UIViewController' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UIViewController/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UIViewController/*.h'
      end
      ss.subspec 'UINavigationController' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UINavigationController/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UINavigationController/*.h'
      end
      ss.subspec 'UITableView' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UITableView/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UITableView/*.h'
      end
      ss.subspec 'UISearchBar' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UISearchBar/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UISearchBar/*.h'
      end
      ss.subspec 'UIControl' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UIControl/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UIControl/*.h'
      end
      ss.subspec 'UIPopoverController' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UIPopoverController/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UIPopoverController/*.h'
      end
      ss.subspec 'UITextField' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UITextField/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UITextField/*.h'
      end
      ss.subspec 'UITextView' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UITextView/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UITextView/*.h'
      end
      ss.subspec 'UIScreen' do |sss|
        sss.source_files = 'CJGCategories/Classes/UIKit/UIScreen/**/*'
        sss.public_header_files = 'CJGCategories/Classes/UIKit/UIScreen/*.h'
      end
  end
  # s.resource_bundles = {
  #   'CJGCategories' => ['CJGCategories/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
