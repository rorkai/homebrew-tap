# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.4.2'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.4.2/asc_4.4.2_macOS_arm64'
      sha256 'c172e7419b80bebabbfa5ea903de51562bb897b920a1073b228ea2cc198a21b6'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.4.2/asc_4.4.2_macOS_amd64'
      sha256 '962e795c6906d451c36e640c7c4b25c5d3cd2b9d477c8110f4fbc8ecc393cf82'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.4.2_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.4.2_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
