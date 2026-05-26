# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '1.5.4'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.5.4/asc_1.5.4_macOS_arm64'
      sha256 'a48f6fadfda774fad6727471292ea560282eeca2ff9fa4642d0bfcf6383c0550'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.5.4/asc_1.5.4_macOS_amd64'
      sha256 '03dab101b28142f7150c33ea495d9546ace3015ba32a2b1679c125f2dceaea7a'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_1.5.4_macOS_arm64' => 'asc'
    else
      bin.install 'asc_1.5.4_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
