# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.3.4'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.3.4/asc_5.3.4_macOS_arm64'
      sha256 'd4a3004973d601119801b30959c52d5fc289910ce294429c01aa63c2982570ba'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.3.4/asc_5.3.4_macOS_amd64'
      sha256 '451d06aefe5b3ab9927dd74f5c87f1e492b1cbf7b00a3a4937eed223f086e537'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.3.4_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.3.4_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
