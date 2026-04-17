# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '1.2.3'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.2.3/asc_1.2.3_macOS_arm64'
      sha256 '754b42e7ff126c49ae975f5ddf3302e58cc0695cf6d266a59ed2907336a87575'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.2.3/asc_1.2.3_macOS_amd64'
      sha256 '9d0f59cc36ee293e6368d0d123e5c95f621500281b611ecb063da120c7e8f1e7'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_1.2.3_macOS_arm64' => 'asc'
    else
      bin.install 'asc_1.2.3_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
