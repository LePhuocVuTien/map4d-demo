import UIKit
import RxDataSources


extension SearchScene {
  
  func createDataSource() -> RxTableDataSource<SectionModel<String, ElementData>> {
    return RxTableDataSource<SectionModel<String, ElementData>>(
      configureCell: { (dataSource, tableView, indexPath, item) -> UITableViewCell in
        let cell = tableView.dequeueReusableCell(
          cellClass: Cell.self,
          indexPath: indexPath
        )
        cell.configure(item)
        return cell
      }
    )
  }
  
  func alert(message: String) {
    print("message")
  }
}
