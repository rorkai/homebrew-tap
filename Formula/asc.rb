# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '2.6.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.6.0/asc_2.6.0_macOS_arm64'
      sha256 '15a9aff831c96db83dbedb242cf3de8ca85c6fe1c8759116bf37355c79b0ffc7'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.6.0/asc_2.6.0_macOS_amd64'
      sha256 'b48385b4ce78dd891817df9041d706cae3e252a38e529c059f03bee689ccbea5'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_2.6.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_2.6.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
