# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.9.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.9.1/asc_4.9.1_macOS_arm64'
      sha256 'b05825228d780afbf227beeea30686013b59516990968288e60d8ce9358f79ef'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.9.1/asc_4.9.1_macOS_amd64'
      sha256 '4c44fd603854e7e1d62b7f531f3cca1827e310d346239bf272253c50b7f49641'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.9.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.9.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
