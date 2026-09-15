# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.3.3'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.3.3/asc_5.3.3_macOS_arm64'
      sha256 'a92283b879b4d3f736040664d120097b78de71941577f0dc59224d04e5874bbb'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.3.3/asc_5.3.3_macOS_amd64'
      sha256 '8ad80ee610693b921896fc10a2ca8bbc0176e36e3756ff49c0355baa2dd0410b'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.3.3_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.3.3_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
