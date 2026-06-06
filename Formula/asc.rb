# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '1.9.2'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.9.2/asc_1.9.2_macOS_arm64'
      sha256 '2e65b4b10aa854acf3784cf98c96120236971ae4d06d1e886ed8bda72dfcae63'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.9.2/asc_1.9.2_macOS_amd64'
      sha256 'aad5ae1f57a5bc6beba6e18061f2279c7c5641c4a138573d10660e71bcffd52d'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_1.9.2_macOS_arm64' => 'asc'
    else
      bin.install 'asc_1.9.2_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
