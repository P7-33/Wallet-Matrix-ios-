import UIKit
import SnapKit

class MacdPointView: UIView {
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let leftSubtitleLabel = UILabel()

    init() {
        super.init(frame: .zero)

        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview()
            maker.top.equalToSuperview().inset(CGFloat.margin4)
        }

        titleLabel.font = .caption
        titleLabel.textAlignment = .right

        addSubview(leftSubtitleLabel)
        leftSubtitleLabel.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.top.equalTo(titleLabel.snp.bottom).offset(CGFloat.margin4)
        }

        leftSubtitleLabel.textColor = .themeStronbuy
        leftSubtitleLabel.font = .caption

        addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { maker in
            maker.leading.equalTo(leftSubtitleLabel.snp.trailing).offset(CGFloat.margin4)
            maker.trailing.equalToSuperview()
            maker.top.equalTo(leftSubtitleLabel)
        }

        subtitleLabel.textColor = .themeJacob
        subtitleLabel.font = .caption
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }

    func bind(histogram: String?, signal: String?, macd: String?, histogramDown: Bool?) {
        titleLabel.text = histogram
        titleLabel.textColor = histogramDown.map { $0 ? .themeLucian : .themeRemus}

        leftSubtitleLabel.text = signal
        subtitleLabel.text = macd
    }

}
