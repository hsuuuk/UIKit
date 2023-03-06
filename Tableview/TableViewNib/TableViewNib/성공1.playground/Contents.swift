import UIKit

var a = [List]()

func configure(with para: MainClass) {
    label.text = "최고온도: \(para.tempMax)도"
}
cell.configure(with: a[indexPath.row].main)


func configure(with para: MainEnum) {
    label.text = "최고온도: \(para.rawValue)도"
}
cell.configure(with: a[indexPath.row].weather[0].main)


func configure(with para: [Weather]) {
    label.text = "최고온도: \(para[0])도"
}
cell.configure(with: a[indexPath.row].weather)


func configure(with para: [Weather]) {
    label.text = "최고온도: \(para[0].icon)도"
}
cell.configure(with: a[indexPath.row].weather)

