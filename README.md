# ImageListView [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)  ![sdf](https://img.shields.io/badge/license-MIT-lightgrey.svg)

### What is it

![Alt text](Files/screen_shot.gif)

### Environment

- Xcode 10.1
- Swift 4.2

### Example
```Swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageListTableViewCell", for: indexPath)  as? ImageListTableViewCell else {
            return UITableViewCell()
        }
        let urls = dataList[indexPath.row]
        cell.imageListView.config(urls.count, fetchImageHandler: { imageView, index in
            imageView?.kf.setImage(with: urls[index])
        })
        cell.selectionStyle = .none
        cell.label.text = "Swift New Balance:\(indexPath.row)"
        return cell
    }
    
```

### Installation

```
github "LieonShelly/ImageListView" ~> 1.0.0

```
