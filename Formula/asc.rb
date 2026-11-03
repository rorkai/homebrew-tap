# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '6.4.0'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.4.0/asc_6.4.0_macOS_arm64'
      sha256 '2743dc84d1351ca62c1ab561dade8026f465158dc09ceff7a6125f54e7788ee1'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.4.0/asc_6.4.0_macOS_amd64'
      sha256 '7a278c00c3f4ec9795baefb09ee1a4d4c7c7aefc06fc6aab71d1a010950e13bf'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_6.4.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_6.4.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
