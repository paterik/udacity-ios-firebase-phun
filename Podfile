# FirebasePhun

platform :ios, '10.0'
use_frameworks!

def firebaseCore
    pod 'Firebase/Storage'
    pod 'Firebase/Core'
    pod 'Firebase/Database'
    pod 'Firebase/RemoteConfig'
    pod 'FirebaseUI'
end

def baseCore
    pod 'BGTableViewRowActionWithImage'
    pod 'CryptoSwift'
    pod 'YNDropDownMenu'
end

target 'FirebasePhun' do
    baseCore
    firebaseCore
end
